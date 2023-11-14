from libqtile.config import Group, Match


group_definitions = [
    {
        'name': 'web1',
        'label': 'W1',
        'matches': [],
        'layout': 'max'
    },
    {
        'name': 'web2',
        'label': 'W2',
        'matches': [],
        'layout': 'max'
    },
    {
        'name': 'web3',
        'label': 'W3',
        'matches': [],
        'layout': 'max'
    },
    {
        'name': 'web4',
        'label': 'W',
        'matches': [],
        'layout': 'max'
    },
    {
        'name': 'misc1',
        'label': 'M1',
        'matches': [],
        'layout': 'columns'
    },
    {
        'name': 'misc2',
        'label': 'M2',
        'matches': [],
        'layout': 'columns'
    },
]

groups = [Group(**group) for group in group_definitions]