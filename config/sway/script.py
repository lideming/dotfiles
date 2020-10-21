#!/usr/bin/env python3
from i3ipc import Connection, Event
import i3ipc.events as events
import time, os, subprocess

sway = Connection()

def show_notification(text, timeout=1000):
    proc = subprocess.Popen(['notify-send', text, '-t', str(timeout)])
    proc.wait(2)

def on_ws_init(_, e: events.WorkspaceEvent):
    print('ws init', e.current.name)

    # Start VS Code on workspace 2
    if e.current.name == '2' and os.system('pgrep code') != 0:
        show_notification('Launching VS Code...', 2000)
        sway.command('exec code')
    
    # Start Firefox on workspace 3
    if e.current.name == '3' and os.system('pgrep firefox') != 0:
        show_notification('Launching Firefox...', 3000)
        sway.command('exec firefox')

sway.on(Event.WORKSPACE_INIT, on_ws_init)

sway.get_workspaces()

sway.main()
