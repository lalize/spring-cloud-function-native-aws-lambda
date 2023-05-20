init-arm64:
	- docker build --build-arg ARCH=arm64v8 --build-arg GRAALVM_ARCH=aarch64 -t workspacearm64 .

init-amd64:
	- docker build --build-arg ARCH=amd64 --build-arg GRAALVM_ARCH=amd64 -t workspaceamd64 .


define bootstrapAndZip
	cp bootstrap build/native/nativeCompile
	chmod 777 build/native/nativeCompile/bootstrap
	zip -j bundle build/native/nativeCompile/*
endef

lambda-arm64:
	- docker run -v $(shell pwd):/workspace workspacearm64
	- $(call bootstrapAndZip)

lambda-amd64:
	- docker run -v $(shell pwd):/workspace workspaceamd64
	- $(call bootstrapAndZip)

lambda-local:
	- ./gradlew clean nativeCompile --no-daemon
	- $(call bootstrapAndZip)
