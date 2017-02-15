# Maintainer: Chrysostomus @forum.manjaro.org

pkgname=manjaro-zsh-config
pkgver=0.1
pkgrel=1
pkgdesc="Zsh configuration for manjaro"
arch=(any)
url="https://github.com/Chrysostomus/$pkgname"
license=('MIT')
depends=('zsh-autosuggestions'
	'zsh-syntax-highlighting'
	'zsh-autosuggestions'
	'zsh-history-substring-search'
	'zsh')
makedepends=('git')
source=("git://github.com/Chrysostomus/$pkgname")
md5sums=('SKIP')

package() {
	cd ${srcdir}
	install -D -m644 $pkgdir/.zshrc ${pkgdir}/etc/skel/.zshrc
	mkdir -p $pkgdir/etc/skel/.config/
	cp -r $srcdir/$pkgname/base16-shell $pkgdir/usr/share/zsh/scripts
	chmod a+x $pkgdir/usr/share/zsh/scripts/base16-shell/*
}
