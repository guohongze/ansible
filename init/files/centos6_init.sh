#!/bin/bash
grep "ntpdate pool.ntp.org" /etc/rc.local
if [ $? != 0 ]
then
        echo "/usr/sbin/ntpdate pool.ntp.org && /sbin/hwclock -w" >> /etc/rc.local
fi
grep "\- *nproc *102400" /etc/security/limits.conf
if [ $? != 0 ]
then
        echo "*              -       nproc       102400" >> /etc/security/limits.conf
fi
grep "\- *nofile *102400" /etc/security/limits.conf
if [ $? != 0 ]
then
        echo "*              -       nofile      102400" >> /etc/security/limits.conf
fi
#history optimise
grep "HISTFILESIZE" /etc/bashrc
if [ $? != 0 ]
then
	echo "export HISTFILESIZE=1000000000" >> /etc/bashrc
	echo "export HISTSIZE=1000000" >> /etc/bashrc
	echo 'export PROMPT_COMMAND="history -a"' >> /etc/bashrc
	echo 'export HISTTIMEFORMAT="%Y-%m-%d_%H:%M:%S "' >> /etc/bashrc
fi
mkdir -p /data/rpm
mkdir -p /data/scripts
mkdir -p /data/server
mkdir -p /data/ansible
mkdir -p /data/svn
mkdir -p /data/logs
mkdir -p /data/conf

