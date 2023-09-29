REPO ?= quay.io/$(USER)

override IMAGE := tryit-editor-pict:latest

image-build:
	@podman build --layers=true -t $(IMAGE) .

image-run:
	@podman run -it --rm -p 8080:8080 -v ./tryit-editor:/var/tryit-editor:Z $(IMAGE)

image-push:
	@podman tag $(IMAGE) $(REPO)/$(IMAGE)
	@podman push $(REPO)/$(IMAGE)
