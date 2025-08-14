build:
  mkdir -p out
  qrencode -o projects.png "https://brennenputh.me/projects"
  pandoc -f markdown resume.md -o out/resume.html --css resume.css --standalone --embed-resources
  weasyprint out/resume.html out/resume.pdf
