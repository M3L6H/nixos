# [Minecraft](/modules/home-manager/games/minecraft.nix)

Minecraft is installed/managed by prismlauncher.

## Troubleshooting

History of problems that have occurred and the solution to them.

### A fatal error has been detected by the Java Runtime Environment...

This error happens after the game is closed.

Full example log:

```
[01:44:59] [Render thread/INFO]: closing rrp ebe:base_resources
#
# A fatal error has been detected by the Java Runtime Environment:
#
#  SIGBUS (0x7) at pc=0x00007f7b8d7d4cfc, pid=17547, tid=17555
#
# JRE version: OpenJDK Runtime Environment (Red_Hat-17.0.10.0.7-3) (17.0.10+7) (build 17.0.10+7)
# Java VM: OpenJDK 64-Bit Server VM (Red_Hat-17.0.10.0.7-3) (17.0.10+7, mixed mode, sharing, tiered, compressed oops, compressed class ptrs, g1 gc, linux-amd64)
# Problematic frame:
# C  [libnvidia-glcore.so.550.67+0x9d4cfc]
#
# Core dump will be written. Default location: Core dumps may be processed with "/usr/lib/systemd/systemd-coredump %P %u %g %s %t %c %h" (or dumping to /run/media/romvnly/263cdc07-046f-49d4-a45b-29b0e3e82f57/home/romvnly/.local/share/PrismLauncher/instances/Fabulously Optimized/.minecraft/core.17547)
#
# An error report file with more information is saved as:
# /run/media/romvnly/263cdc07-046f-49d4-a45b-29b0e3e82f57/home/romvnly/.local/share/PrismLauncher/instances/Fabulously Optimized/.minecraft/hs_err_pid17547.log
#
# If you would like to submit a bug report, please visit:
#   https://bugzilla.redhat.com/enter_bug.cgi?product=Fedora&component=java-17-openjdk&version=38
# The crash happened outside the Java Virtual Machine in native code.
# See problematic frame for where to report the bug.
#
Process was killed by user.
```

**Solution**

Set `__GL_THREADED_OPTIMIZATIONS=0` in the `Settings/Environment variables`
section of the minecraft instance.

