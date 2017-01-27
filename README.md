# Samsung Galaxy Star
Device Configuration for Samsung Galaxy Star to build CyanogenMod 14.1 (Android 7.1).

## Pre-requisites
* Android build environment set up.
* Basic knowledge of Linux Terminal commands.

## How to build
* First of all, initialize the repo in a directory of your choice with **cm-14.1** branch.
* To get device specific stuffs and source patches, use this local manifest - https://github.com/TeamButter/local_manifest/blob/cm-14.1/mint2g.xml, and put it in .repo/local_manifests.
* `repo sync`
* `source build/envsetup.sh && brunch mint2g`

## About our forks of CM source repos
We will try to update them as regularly as possible.

## Credits (no specific order)
* halfpsych
* unjust
* Doc
* pawitp
* dhinesh77
* Alonso1398
* ngoquang2708
* koquantam
* Lehkeda
* Dreamstar
* wakaber
* me?
