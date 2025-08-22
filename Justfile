build:
  mkdir -p out
  qrencode -o projects.png "https://brennenputh.me/projects"
  pandoc -f markdown resume.md -o out/resume.html --css resume.css --standalone --embed-resources
  weasyprint out/resume.html out/resume.pdf

dev:
  -xdg-open out/resume.html
  -xdg-open out/resume.pdf
  inotifywait -r -m -e modify resume.md resume.css | while read file_path file_event file_name; do just build; done
