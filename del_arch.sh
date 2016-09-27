echo "###########################################################################"
echo "*****************Begin delete obsolete archivelog all for orcl*************"
echo "starting Time:"'date'
echo "###########################################################################"
export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/11.2.0
export ORACLE_SID=orcl

$ORACLE_HOME/bin/rman target / msglog /home/oracle/sh/orcl_arch.log append << EOF
run{
	allocate channel t1 type disk;
	delete nopromt archivelog until time "sysdate-1";
	release channel t1;
	}
EOF
echo "\n**************************************************************************"
echo "End Time:"'date'
echo "****************************************************************************"
echo "                                                                            "
echo "                                                                            "
