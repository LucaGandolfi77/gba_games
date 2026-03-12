#include <gba_console.h>
#include <gba_video.h>
#include <gba_interrupt.h>
#include <gba_input.h>
#include <stdio.h>

int main(void)
{
    irqInit();
    irqEnable(IRQ_VBLANK);
    consoleDemoInit();

    iprintf("Hello, GBA world!\n");
    iprintf("Premi START per uscire.\n");

    while (1)
    {
        VBlankIntrWait();
        scanKeys();
        if (keysDown() & KEY_START) break;
    }

    return 0;
}
