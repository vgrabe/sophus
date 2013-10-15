GIT_DIR = sophus_src
GIT_URL = git://github.com/strasdat/Sophus.git
GIT_REVISION = a621ff
	
all: sophus

sophus: download
	cd sophus_src && git checkout $(GIT_REVISION) && cd .. && \
	mkdir -p build && cd build && \
	cmake -DCMAKE_INSTALL_PREFIX=`pwd`/..  ../$(GIT_DIR) && \
  	make install

download:
	git clone $(GIT_URL) $(GIT_DIR)
	cd $(GIT_DIR) && git checkout $(GIT_REVISION)

clean: 
	rm -rf $(GIT_DIR) patched build include lib rospack_nosubdirs

