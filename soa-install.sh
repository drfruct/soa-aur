#!/bin/bash

echo "Squeeze on Arch Installer"
echo
echo "SQUEEZE ON ARCH IS PROVIDED 'AS IS' AND ANY EXPRESS OR IMPLIED"
echo "WARRANTIES ARE DISCLAIMED. IN NO EVENT SHALL THE SOFTWARE PROVIDER BE"
echo "LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR"
echo "CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF"
echo "SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR"
echo "BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,"
echo "WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE"
echo "OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN"
echo "IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
echo

while true; do
    read -p "Do you agree to the above and wish to continue? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo

pushd `dirname $0` > /dev/null

if [[ -f ../binary-repo ]]; then

	sudo pacman -S --noconfirm --noprogressbar turbolua libsoxr squeezelite soa-web 

else

	echo "1/4 turbolua" > /tmp/soa-install-progress

	cd turbolua
	makepkg -c -i -f -s --noconfirm --noprogressbar
	cd ..

	echo "2/4 soa-web" > /tmp/soa-install-progress
	
	cd soa-web
	makepkg -c -i -f -s --noconfirm --noprogressbar
	cd ..
	
	echo "3/4 libsoxr" > /tmp/soa-install-progress
	
	cd libsoxr
	makepkg -c -i -f -s --noconfirm --noprogressbar
	cd ..
	
	echo "4/4 squeezelite" > /tmp/soa-install-progress

	cd squeezelite
	makepkg -c -i -f -s --noconfirm --noprogressbar
	cd ..
	
	rm /tmp/soa-install-progress

fi

popd > /dev/null
