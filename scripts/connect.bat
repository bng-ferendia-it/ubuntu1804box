@echo off
echo "Connect to network share"
net use V: \\10.0.15.42\htdocs /user:vagrant vagrant
