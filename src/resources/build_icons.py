import os

source_folder = ''

for directory in os.listdir(source_folder):
    svg_dir = source_folder + directory + '/SVG/'
    if os.path.exists(svg_dir):
        for file in os.listdir(svg_dir):
            if file.find('16') != -1 and file.find('regular') != -1:
                os.system(f'cp "{svg_dir + "/" + file}" ./assets/')
