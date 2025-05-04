const Widget = imports.widget;
const App = imports.app;

const bar = Widget.Bar({
  name: 'topbar',
  anchor: ['top', 'left', 'right'],
  exclusivity: 'exclusive',
  child: Widget.CenterBox({
    start_widget: Widget.Label({
      label: 'AGS Bar', class_name: 'logo'
    }),

    center_widget: Widget.Label({
      label: 'Center', class_name: 'center'
    }),

    end_widget: Widget.Clock({
      format: '%H:%M', class_name: 'clock'
    }),
  }),
  class_name: 'bar',
});

App.config({
  windows: [bar],
});
