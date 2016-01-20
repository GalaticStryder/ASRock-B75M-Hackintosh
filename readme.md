Mac OS X on my "Wild Boar" desktop
==========================

A guide for installing Mac OS X on my **Wild Board desktop computer**. All the information needed about hardware components are in **information** folder in case you want to patch it on your own. Notice that you can follow this guide for different laptop models if they have close components.

Let's point the north here:

- **Intel Sandy Bridge i5-2310 CPU**
- **EVGA GeForce GTX550Ti GPU**

Hardware components that match the assets above will most likely follow the same procedure:

- **A.** DSDT and SSDT extracting.
- **B.** Clover installation and patching.

Hardware
-------------------------

You'll find all hardware related stuff in **information** folder. The basic hardware information about the main laptop components are the following:

Instructions:
-------------------------

Clone this repository somewhere.

		git clone https://github.com/GalaticStryder/ASRock-B75M-Hackintosh
		cd ASRock-B75M-Hackintosh
	./clean.sh

**_A_)**
-------------------------

Extract ACPI files from GNU/Linux:

	cd acpi
	mkdir original
	sudo cp -R /sys/firmware/acpi/tables original
	sudo chmod -R ugo+rw original
	sudo chown -R galatic original

Doing this way we avoid permission problems by making it read/write able by anyone. Also, this changes from root to my user the ownership, just in case. Don't forget to change 'galatic' to your user name.

Copy the files under **dynamic** folder to the folder above in the tree, together the other extracted files and delete the dynamic folder. Remove files that don't have SSDT or DSDT in the name, you don't need those.

To rename the files I've just adapted RehabMan's script.

	./aml-rename.sh

Now it should contain one DSDT and a nine SSDTs as **.aml** files in **original** folder.

To patch your ACPI files (when I say ACPI means both DSDTs/SSDTs in general) you will need to use MaciASL and iasl tools. Copy iasl binary from the folder **extra** to /usr/bin for system-wide ability.

	cd ..
	cd extras
	sudo cp iasl /usr/bin/iasl

Cortesy of RehabMan at [BitBucket](https://bitbucket.org/RehabMan/acpica/downloads).

Proceed to **dsl** generation after the previous step.

	cd ..
	cd acpi
	mkdir dsl
	cd original

Using your favorite text editor, create a refs.txt file, I use vim.

	vim refs.txt  

Paste the following content:

	External (_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj, 2)
	External (_SB_.PCI0.LPCB.H_EC.ECWT, MethodObj, 2)
	External (_SB_.PCI0.LPCB.H_EC.ECRD, MethodObj, 1)

Save it.

Then run **iasl** and move the files to the previously created **dsl** folder:

	iasl -da -dl -fe refs.txt *.aml
	mv *.dsl ../dsl/

**Don't get confused with dsl folder and extension, ok?**

Patches are unknown as I'm not booting this project yet.

That's a click **compile** and **adjust** job. After the solving all errors and saving all **dsl** files, you've got to save them all as **.aml** back again, all of them. Put the saved ones (.aml) in the **compiled** folder one by one.

Credits
-------------------------

- Nobody
