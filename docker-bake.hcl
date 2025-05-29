group "default" {
  targets = ["web"]
}
target "web" {
  context = "."
  dockerfile = "Dockerfile"
  tags = ["jahirrob19/my-image:latest"]
}
