echo "build kitaev model"
docker build -t hw/kitaev ./kitaev

echo "build dozat model"
docker build -t hw/dozat ./dozat
