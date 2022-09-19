module servers.erp;

@safe:
mixin ImportPhobos;
mixin ImportDubs;
public import colored;

mixin ImportUim;

// Additional imports
public import uim.central;
public import uim.erp;

public import layouts.tabler;

mixin(ImportLocal!("erp"));

DH5App serverErp;
static this() {
  serverErp = new class DH5App {
    this() { super(); 
    }
  };
}