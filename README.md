# Pi CarHU - Raspberry Pi Car Head Unit
This project is based on the open source project called CrankShaft [https://getcrankshaft.com/](discontinued) which makes use of the Open Auto to create a Android Auto car head unit using Raspberry Pi. The aim is to improve the UI and implement new features in the future.

To get involved, contact me through email: raghul.shanmuganathan06@gmail.com

# Docker build image

- Ensure binfmt support installed [binfmt-support](binfmt-misc.md)

- Create config for pi-gen
```bash
cp config.example config
```
- Build image
```bash
./build-docker.sh
```
