#!/bin/env python3

import os

folders = [i for i in os.listdir('.') if os.path.isdir(i)]

qrc_content_start = \
'''
<RCC>
    <qresource prefix="/">
'''
qrc_content_end = \
'''
    </qresource>
</RCC>
'''

qrc_content = qrc_content_start

for folder in folders:
    for file in os.listdir(folder):
        qrc_content += f'        <file>{folder}/{file}</file>\n'

qrc_content += qrc_content_end
print(qrc_content)

