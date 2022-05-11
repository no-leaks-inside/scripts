## Sync ROM [1/2] ##

mkdir DerpFest
cd DerpFest

git config --global user.name "victor"
git config --global user.email "victor@yourdomain.com"

repo init -u ssh://git@github.com/DerpFest-12/manifest.git -b 12.1

## Sync Device Tree ##

git clone https://github.com/victor4cris/local_manifest -b S10-LOS ./.repo/local_manifests

## Sync ROM [2/2] ##

repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j8

## Build ROM S10/N10 ##
. build/envsetup.sh

lunch derp_beyond0lte-userdebug

mka derp

lunch derp_beyond1lte-userdebug

mka derp

lunch derp_beyond2lte-userdebug

mka derp

lunch derp_beyondx-userdebug

mka derp

lunch derp_d1-userdebug

mka derp

lunch derp_d2s-userdebug

mka derp

lunch derp_d2x-userdebug

mka derp

## Create Dump with rom Files ##

mkdir dump

cp out/target/product/beyond0lte/DerpFest*.zip ./dump
cp out/target/product/beyond1lte/DerpFest*.zip ./dump
cp out/target/product/beyond2lte/DerpFest*.zip ./dump
cp out/target/product/beyondx/DerpFest*.zip ./dump
cp out/target/product/d1/DerpFest*.zip ./dump
cp out/target/product/d2s/DerpFest*.zip ./dump
cp out/target/product/d2x/DerpFest*.zip ./dump

cp out/target/product/beyond0lte/beyond0lte.json ./dump
cp out/target/product/beyond1lte/beyond1le.json ./dump
cp out/target/product/beyond2lte/beyond2lte.json ./dump
cp out/target/product/beyondx/beyondx.json ./dump
cp out/target/product/d1/d1.json ./dump
cp out/target/product/d2s/d2.json ./dump
cp out/target/product/d2x/d2x.json ./dump

## Done ##

echo "I: - Build and dump was succeded !"
