# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

if [ "$PS1" ]; then
  if [ "$BASH" ] && [ "$BASH" != "/bin/sh" ]; then
    # The file bash.bashrc already sets the default PS1.
    # PS1='\h:\w\$ '
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  else
    if [ "`id -u`" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi

# The default umask is now handled by pam_umask.
# See pam_umask(8) and /etc/login.defs.

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

export JAVA_HOME=/opt/jdk1.7.0_51
export ANT_HOME=/opt/ant-1.9.3
export M2_HOME=/opt/maven-3.0.5
export MAVEN_OPTS="-Xms256m -Xmx512m"
export GOROOT=/opt/go
export GOPATH=/opt/gowork
export NODE_HOME=/opt/node

export HADOOP_PREFIX=/opt/hadoop-2.2.0
export HADOOP_COMMON_HOME=$HADOOP_PREFIX
export HADOOP_HDFS_HOME=$HADOOP_PREFIX
export HADOOP_MAPRED_HOME=$HADOOP_PREFIX
export HADOOP_YARN_HOME=$HADOOP_PREFIX
export HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop

export HADOOP_CLASSPATH=/opt/hadoop-2.2.0/share/hadoop/common/*.jar:/opt/hadoop-2.2.0/share/hadoop/common/lib/*.jar:/opt/hadoop-2.2.0/share/hadoop/hdfs/*.jar:/opt/hadoop-2.2.0/share/hadoop/hdfs/lib/*.jar:/opt/hadoop-2.2.0/share/hadoop/mapreduce/*.jar:/opt/hadoop-2.2.0/share/hadoop/mapreduce/lib/*.jar:/opt/hadoop-2.2.0/share/hadoop/tools/lib/*.jar:/opt/hadoop-2.2.0/share/hadoop/yarn/*.jar:/opt/hadoop-2.2.0/share/hadoop/yarn/lib/*.jar:$HADOOP_CLASSPATH


export HIVE_HOME=/opt/hive-0.12.0

export HUE_HOME=/opt/hue

export SQOOP_HOME=/opt/sqoop-1.99.3

export PATH=$SQOOP_HOME/bin:$HUE_HOME/build/env/bin:$NODE_HOME/bin:$GOROOT/bin:$JAVA_HOME/bin:$ANT_HOME/bin:$M2_HOME/bin:$HADOOP_PREFIX/bin:$HADOOP_PREFIX/sbin:$HIVE_HOME/bin:$PATH



