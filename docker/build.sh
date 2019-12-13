### 
# @Description: In User Settings Edit
 # @Author: your name
 # @Date: 2019-08-14 09:26:18
 # @LastEditTime: 2019-08-16 15:06:58
 # @LastEditors: Please set LastEditors
 ###

REGISTRY="registry-vpc.cn-shanghai.aliyuncs.com"
NAMESPACE="shuzhi"
IMAGE_NAME="spc_components"
IMAGE_URL="${REGISTRY}/${NAMESPACE}/${IMAGE_NAME}"
IMAGE_VERSION="$1"

PYTHON_VERSION="3.7"
PYTHON_MAJOR_VERSION="3"

docker build \
-t ${IMAGE_URL}:${PYTHON_VERSION}-${IMAGE_VERSION} \
-t ${IMAGE_URL}:${PYTHON_VERSION} \
-t ${IMAGE_URL}:${PYTHON_MAJOR_VERSION}-${IMAGE_VERSION} \
-t ${IMAGE_URL}:${PYTHON_MAJOR_VERSION} \
-t ${IMAGE_URL}:latest \
. \
-f ./docker/$1/Dockerfile \
--build-arg PYTHON_VERSION=${PYTHON_VERSION} \
${@:4}

docker push ${IMAGE_URL}:${PYTHON_VERSION}-${IMAGE_VERSION}
docker push ${IMAGE_URL}:${PYTHON_VERSION}
docker push ${IMAGE_URL}:${PYTHON_MAJOR_VERSION}-${IMAGE_VERSION}
docker push ${IMAGE_URL}:${PYTHON_MAJOR_VERSION}
docker push ${IMAGE_URL}:latest