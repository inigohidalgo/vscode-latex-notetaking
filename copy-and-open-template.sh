template=~/vscode-notetaking/vscode-latex-notetaking/template.svg

default='template'
blank='blank'
old_filename=${1:-default}
working_directory=${2:-blank}
fig_dir="${working_directory}/figures"
mkdir "$fig_dir"
echo $fig_dir

filename=$(echo $old_filename | tr ' ' '_')
filepath="$working_directory/figures/$filename"

cp -n $template "$filepath.svg"

python3 ~/vscode-notetaking/vscode-latex-notetaking/inkscape-shortcut-manager/main.py & inkscape "$filepath.svg"

inkscape -D "$filepath".svg -A "$filepath".pdf --export-latex

echo $filename