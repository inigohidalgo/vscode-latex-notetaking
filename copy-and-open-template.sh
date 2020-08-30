template=~/vscode-notetaking/vscode-latex-notetaking/template.svg

default='template'
old_filename=${1:-default}
mkdir figures

filename=$(echo $old_filename | tr ' ' '_')
filepath=figures/$filename

cp -n $template $filepath.svg

python3 ~/vscode-notetaking/vscode-latex-notetaking/inkscape-shortcut-manager/main.py & inkscape $filepath.svg

inkscape -D $filepath.svg -A $filepath.pdf --export-latex

echo $filename