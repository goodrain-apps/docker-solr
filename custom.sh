#!/bin/bash
#init first core for first start
[[ $PAUSE ]] && sleep $PAUSE
if [ ! -d /var/solr/data/${CORE_NAME:-mycore}/data ];then
  cp -r /opt/solr-${SOLR_VERSION}/server/mycore /var/solr/data/${CORE_NAME:-mycore}
  sed -i "s/name=mycore/name=${CORE_NAME:-mycore}/" /var/solr/data/${CORE_NAME:-mycore}/core.properties
fi

if [[ ${MEMORY_SIZE} ]];then
   case ${MEMORY_SIZE:-small} in
    "micro")
       export default_java_mem_opts="-Xms90m -Xmx90m -Xss512k  -XX:MaxDirectMemorySize=12M"
       echo "Optimizing java process for 128M Memory...." >&2
       ;;
    "small")
       export default_java_mem_opts="-Xms180m -Xmx180m -Xss512k -XX:MaxDirectMemorySize=24M "
       echo "Optimizing java process for 256M Memory...." >&2
       ;;
    "medium")
       export default_java_mem_opts="-Xms360m -Xmx360m -XX:MaxDirectMemorySize=48M"
       echo "Optimizing java process for 512M Memory...." >&2
       ;;
    "large")
       export default_java_mem_opts="-Xms720m -Xmx720m -XX:MaxDirectMemorySize=96M "
       echo "Optimizing java process for 1G Memory...." >&2
       ;;
    "2xlarge")
       export default_java_mem_opts="-Xms1420m -Xmx1420m -XX:MaxDirectMemorySize=192M"
       echo "Optimizing java process for 2G Memory...." >&2
       ;;
    "4xlarge")
       export default_java_mem_opts="-Xms2840m -Xmx2840m -XX:MaxDirectMemorySize=384M "
       echo "Optimizing java process for 4G Memory...." >&2
       ;;
    "8xlarge")
       export default_java_mem_opts="-Xms5680m -Xmx5680m -XX:MaxDirectMemorySize=768M"
       echo "Optimizing java process for 8G Memory...." >&2
       ;;
    16xlarge|32xlarge|64xlarge)
       export default_java_mem_opts="-Xms8G -Xmx8G -XX:MaxDirectMemorySize=1536M"
       echo "Optimizing java process for biger Memory...." >&2
       ;;
    *)
       export default_java_mem_opts="-Xms128m -Xmx128m -XX:MaxDirectMemorySize=24M"
       echo "Optimizing java process for 256M Memory...." >&2
       ;;
   esac
   export SOLR_JAVA_MEM=${default_java_mem_opts}
fi