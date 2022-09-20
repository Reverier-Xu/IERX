import os
import sys


def process(source_folder: str):
    for directory in os.listdir(source_folder):
        svg_dir = source_folder + directory + '/SVG/'
        if os.path.exists(svg_dir):
            for file in os.listdir(svg_dir):
                if file.find('16') != -1:
                    os.system(f'cp "{svg_dir + "/" + file}" ./assets/')

if __name__ == '__main__':
    source_folder = sys.argv[1]
    process(source_folder)
