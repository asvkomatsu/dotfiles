from libqtile import layout

from colors import color_schema

layout_defaults = dict(
    margin=2,
    border_focus=color_schema['yellow'],
    border_normal=color_schema['bg'],
)

floating_defaults = dict(
    margin=2,
    border_focus=color_schema['red'],
    border_normal=color_schema['yellow'],
)

layouts = [
    layout.Max(**layout_defaults),
    layout.Columns(**layout_defaults),
    layout.Floating(**floating_defaults),
]

floating_layout = layout.Floating(
    **floating_defaults,
    float_rules = [
        *layout.Floating.default_float_rules,
    ]
)