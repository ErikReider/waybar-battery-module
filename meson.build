project(
  'WaybarBatteryModule',
  ['c', 'vala'],
  version: '0.2',
  meson_version: '>= 0.50.0',
  default_options: [ 'warning_level=2',],
)

add_project_arguments(
    ['--vapidir', join_paths(meson.current_source_dir(), 'vapi')],
    language: 'vala'
)

sources = [
  './src/main.vala',
  './src/client.vala',
  './src/login1_interface.vala',
]

app_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gee-0.8'),
  dependency('upower-glib', version: '>= 0.99.0'),
]

args = [
  '--target-glib=2.50',
]

executable(
  'waybar-battery-module',
  sources,
  vala_args: args, 
  dependencies: app_deps,
  install: true,
)
