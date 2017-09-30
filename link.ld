ENTRY(loader)						/*name of the entry label*/

SECTIONS {
    . = 0x00100000;					/* the code should be loaded at 1 MB*/
									/* addresses lower than 1MB are used for 
									   BIOS, GRUB, and memory-mapped I/O */
    
    .text ALIGN (0x1000) :			/* align at 4KB */
	{
		*(.text)					/* all text sections from all files */
	}

    .rodata ALIGN (0x1000) : 		/* align at 4K B*/
    {
		*(.rodata*)					/* all read-only sections from all files */
	}
	
	.data ALIGN (0x1000) : 			/* align at 4KB */
	{
		*(.data) 					/* all data sections from all files */
	}

	/* (BSS) - basic service set
	* Part of the data segment containing statically-allocated variables 
	* represented solely by zero-initialized bits initially. 
	* Typically only the length of the bss section, no data, is stored in the 
	* object file.
	*/
	
	.bss ALIGN (0x1000) : 			/* align at 4KB */
	{	
		*(COMMON)					/* all COMMON sections from all files */
		*(.bss)						/* all bss sections from all files*/
	}
    
}
