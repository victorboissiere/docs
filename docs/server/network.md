## Interfaces

**How to restart ?**

First **check** the file syntax using `sudo ifup --no-act br0`.

Then safely restart with `sudo ifdown br0 && sudo ifup br0`
