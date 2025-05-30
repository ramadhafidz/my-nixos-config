import App from 'resource:///com/github/Aylur/ags/app.js'
import Widget from 'resource:///com/github/Aylur/ags/widget.js'
import SystemTray from 'resource///com/github/Aylur/ags/service/system_tray.js'
import { Hyprland } from 'resource///com/github/Aylur/ags/service/hyprland.js'
import { exec, execAsync } from 'resource///com/github/Aylur/ags/utils.js'

const Workspace = () => Widget.box({
  class_name: 'workspace',
  children: Hyprland.bind('workspace').transform(ws => {
    return ws.sort((a, b) => a.id - b.id).map(w => Widget.Button({
      on_clicked: () => Hyprland.sendMessage(`dispatch workspace ${w.id}`),
      child: Widget.Label(`${w.id}`),
      class_name: Hyprland.active.workspace.bind('id').transform(id => `${id === w.id ? 'focused' : ''}`),
    }));
  }),
});

const LeftWidgets = () => Widget.Box({
  spacing: 8,
  children: [
    Workspace(),
  ]
});

const Clock = () => Widget.Label({
  class_name: 'clock',
  setup: self => self.poll(1000, () => {
    self.label = exec('date "+%H:%M %b %d"');
  }),
});

const CenterWidgets = () => Widget.Box({
  spacing: 8,
  children: [
    Clock(),
  ],
});

const SysTray = () => Widget.Box({
  class_name: 'system-tray',
  children: SystemTray.bind('items').transform(items =>
    items.map(item => Widget.Button({
      child: Widget.Icon({ icon: item.bind('icon') }),
      on_primary_click: (_, event) => item.activate(event),
      on_secondary_click: (_, event) => item.openMenu(event),
      tooltip_markup: item.bind('tooltip_markup'),
    }))
  ),
});

const RightWidgets = () => Widget.Box({
  hpack: 'end',
  spacing: 8,
  children: [
    SysTray(),
  ],
});

const BarWindow = (monitor = 0) => Widget.Window({
  name: `bar-${monitor}`,
  class_name: 'bar-window',
  monitor,
  anchor: ['top', 'left', 'right'],
  exclusivity: 'exclusive',
  child: Widget.CenterBox({
    class_name: 'centerbox-bar',
    start_widget: LeftWidgets(),
    center_widget: CenterWidgets(),
    end_widget: RightWidgets(),
  }),
});

export default {
  style: App.configDir + '/style.css',
  windows: [
    BarWindow(0),
  ],
};
