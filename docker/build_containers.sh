echo "build kitaev model"
mv Dockerfile_kitaev Dockerfile
docker build -t hw/kitaev .
mv Dockerfile Dockerfile_kitaev

echo "build dozat model"
mv Dockerfile_dozat Dockerfile
docker build -t hw/dozat .
mv Dockerfile Dockerfile_dozat
