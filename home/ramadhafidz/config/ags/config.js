// Import modul yang diperlukan
const Widget = await Service.import('widgets');
const Bar = await Service.import('bar');

// Konfigurasi utama
export default {
    style: `${App.configDir}/style.css`,
    windows: [
        // Bar atas
        Widget.Window({
            name: 'top-bar',
            anchor: ['top', 'left', 'right'],
            child: Widget.CenterBox({
                start_widget: Widget.Box({
                    children: [
                        Widget.Label({
                            label: '', // Icon distro
                            class_name: 'distro-icon',
                        }),
                    ],
                }),
                center_widget: Widget.Label({
                    label: 'Clock',
                    class_name: 'clock',
                    setup: self => self.poll(1000, label => {
                        label.label = new Date().toLocaleTimeString();
                    }),
                }),
                end_widget: Widget.Box({
                    children: [
                        Widget.Label({
                            label: '', // Icon volume
                            class_name: 'volume-icon',
                        }),
                        Widget.Label({
                            label: '', // Icon wifi
                            class_name: 'wifi-icon',
                        }),
                        Widget.Label({
                            label: '🔋', // Icon baterai
                            class_name: 'battery-icon',
                        }),
                    ],
                }),
            }),
        }),
    ],
};
