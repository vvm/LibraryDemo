if [ $# == 0 ]; then 
	echo "需要指定target。默认打包lib，如需打包framework 请指定" 
	exit 1; 
fi 

#后缀名
EXT_NAME='a'
SRCROOT='.'
PROJECT_NAME=$1

#要build的target名
target_Name=${PROJECT_NAME}
    echo "target_Name=${target_Name}"

lib_Name=lib${PROJECT_NAME}

if [ $# == 2 ] ; then 
	if [ ! $2 == 'lib' ]&&[ ! $2 == 'framework' ]; then
		echo "打包格式为lib 或 framework" 
		exit 2; 
	fi
	if [[ $2 == 'framework' ]]; then
		EXT_NAME='framework'
		lib_Name=${PROJECT_NAME}	
	fi
fi 



#build之后的文件夹路径
build_DIR=${SRCROOT}/build
    echo "build_DIR=${build_DIR}"

#真机build生成的头文件的文件夹路径
DEVICE_DIR_INCLUDE=${build_DIR}/Release-iphoneos/include/${PROJECT_NAME}
    echo "DEVICE_DIR_INCLUDE=${DEVICE_DIR_INCLUDE}"

#真机build生成的.a文件路径
DEVICE_DIR_A=${build_DIR}/Release-iphoneos/${lib_Name}.${EXT_NAME}
    echo "DEVICE_DIR_A=${DEVICE_DIR_A}"

#模拟器build生成的.a文件路径
SIMULATOR_DIR_A=${build_DIR}/Release-iphonesimulator/${lib_Name}.${EXT_NAME}
    echo "SIMULATOR_DIR_A=${SIMULATOR_DIR_A}"

#目标文件夹路径
INSTALL_DIR=${SRCROOT}/Products/${PROJECT_NAME}
    echo "INSTALL_DIR=${INSTALL_DIR}"

#目标头文件文件夹路径
INSTALL_DIR_Headers=${SRCROOT}/Products/${PROJECT_NAME}/Headers
    echo "INSTALL_DIR_Headers=${INSTALL_DIR_Headers}"

#目标.a路径
INSTALL_DIR_A=${SRCROOT}/Products/${PROJECT_NAME}/${lib_Name}.${EXT_NAME}
    echo "INSTALL_DIR_A=${INSTALL_DIR_A}"

#判断build文件夹是否存在，存在则删除
if [ -d "${build_DIR}" ]
then
rm -rf "${build_DIR}"
fi

#判断目标文件夹是否存在，存在则删除该文件夹
if [ -d "${INSTALL_DIR}" ]
then
rm -rf "${INSTALL_DIR}"
fi
#创建目标文件夹
mkdir -p "${INSTALL_DIR}"

#build之前clean一下
xcodebuild -target ${target_Name} clean

#模拟器build
xcodebuild -target ${target_Name} -configuration Release -sdk iphonesimulator

#真机build
xcodebuild -target ${target_Name} -configuration Release -sdk iphoneos

#合成
if [[ ${EXT_NAME} == 'a' ]]; then
	#复制头文件到目标文件夹
	cp -R "${DEVICE_DIR_INCLUDE}" "${INSTALL_DIR_Headers}"
	#合并lib
	lipo -create "${DEVICE_DIR_A}" "${SIMULATOR_DIR_A}" -output "${INSTALL_DIR_A}"	
else
	#复制frame出来
	cp -R "${DEVICE_DIR_A}" "${INSTALL_DIR_A}"
	#合并lib
	lipo -create "${DEVICE_DIR_A}/${target_Name}" "${SIMULATOR_DIR_A}/${target_Name}" -output "${INSTALL_DIR_A}/${target_Name}"
fi

#清空build目录
if [ -d "${build_DIR}" ]
then
rm -rf "${build_DIR}"
fi

#打开目标文件夹
open "${INSTALL_DIR}"