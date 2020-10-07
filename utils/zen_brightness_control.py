#!/usr/bin/python3

import os
import re
from dataclasses import dataclass
import time

backlight_file = '/sys/class/backlight/intel_backlight/brightness'
max_backlight_file = '/sys/class/backlight/intel_backlight/max_brightness'
bottom_brightness_file = '/home/pragy/.brightness'
# can be found by turning the backlight to 0,
# and reading the contents of backlight_file
min_backlight = 240
re_monitor_data = re.compile(r'(\d+):\s*\S+\s*(\d+)/(\d+)x(\d+)/(\d+)\+(\d+)\+(\d+)\s*(.*)$')
poll_time = 3  # seconds
hot_mode_poll_time = 0.2  # seconds
# allows the top brightness to go beyond 100%, if needed for viewing darker graphics
boost = 1.25

@dataclass
class Monitor:
    index: int
    width_px: int
    width_mm: int
    height_px: int
    height_mm: int
    displacement_x: int
    displacement_y: int
    name: str


def get_monitors():
    data = os.popen('xrandr --listmonitors').read()
    monitors = []
    for line in data.split('\n')[1:]:
        line = line.strip()
        if not line:
            continue
        monitors.append(Monitor(*re_monitor_data.match(line).groups()))
    return monitors


def adjust(percent, bottom_brightness):
    monitors = get_monitors()
    if len(monitors) != 2:
        os.system(f'notify-send -t 5000 -i face-surprise-symbolic {len(monitors)} monitor(s) detected!' + '\r'.join(map(str, monitors)))
        print(f'{len(monitors)} monitor(s) detected!\n' + '\n'.join(map(str, monitors)))
        return

    primary, secondary = monitors
    if primary.height_px == 1000:
        primary, secondary = secondary, primary

    os.system(f'xrandr --output {primary.name} --brightness {percent * boost}')
    os.system(f'xrandr --output {secondary.name} --brightness {bottom_brightness}')


def main():
    with open(max_backlight_file, 'r') as f:
        max_backlight = int(f.read())

    percent = None
    hot_mode_start_time = None

    while True:
        with open(backlight_file, 'r') as f:
            backlight = int(f.read())
        with open(bottom_brightness_file, 'r') as f:
            bottom_brightness = float(f.read().strip())

        new_percent = (backlight - min_backlight) / max_backlight
        if percent != new_percent:
            hot_mode_start_time = time.time()
            adjust(new_percent, bottom_brightness)
        elif hot_mode_start_time is not None:
            if time.time() - hot_mode_start_time > poll_time:
                hot_mode_start_time = None

        percent = new_percent
        if hot_mode_start_time is None:
            time.sleep(poll_time)
            adjust(percent, bottom_brightness)
        else:
            time.sleep(hot_mode_poll_time)


if __name__ == '__main__':
    main()
