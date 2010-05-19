/* **********************************************************
 * Copyright (C) 2007 VMware, Inc.
 * All Rights Reserved
 * **********************************************************/

const DESCRIPTION = "VMware Virtual Machine Remote Console Plug-in";
const VERSION = "2.5.0.122581";
const PLID = "VMware/VMRC,version=2.5.0.122581";
const PLID_SIMPLE = "VMware/VMRC";
const REQ_DISK_SPACE_BYTES = 56454856;

function go() {

   var plid = PLID;
   var err = initInstall(DESCRIPTION, plid, VERSION);

   if (err != SUCCESS) {
      logComment("initInstall() failed, error " + err + ", trying simple PLID");
      plid = PLID_SIMPLE;
      err = initInstall(DESCRIPTION, plid, VERSION);
      if (err != SUCCESS) {
         alert("Failed to install: error " + err);
         return;
      }
   }

   var targetDir = getFolder("Current User", "../../plugins");
   var bytesAvailable = File.diskSpaceAvailable(targetDir);

   if (bytesAvailable > 0 && bytesAvailable < REQ_DISK_SPACE_BYTES) {
      alert("Not enough disk space available, " + 
            "aborting installation of VMware VMRC Plug-in.");
   }

   logComment("Attempting installation of VMware VMRC Plug-in to " + targetDir);

   addFile(plid, VERSION, "plugins/np-vmware-vmrc-2.5.0-122581.so", targetDir, "");
   addFile(plid, VERSION, "components/xpcom-vmware-vmrc-2.5.0-122581.xpt", targetDir, "");
   addDirectory(plid, VERSION, "plugins/vmware-vmrc-2.5.0-122581", targetDir,
                "vmware-vmrc-2.5.0-122581");

   err = performInstall();
   if (err != SUCCESS) {
      alert("Installation of VMware VMRC Plug-in failed with error " + err);
      return;
   } 
   
   refreshPlugins(true);
}

go();
