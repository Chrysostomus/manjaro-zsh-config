# Maintainer: Chrysostomus @forum.manjaro.org

pkgname=manjaro-zsh-config
pkgver=0.1
pkgrel=1
pkgdesc="Zsh configuration for manjaro"
arch=(any)
url="https://github.com/Chrysostomus/$pkgname"
_gitcommit=4703b44f554375b2bf502008df85e4089eeee517
license=('MIT')
depends=('zsh-autosuggestions'
	'zsh-syntax-highlighting'
	'zsh-completions'
	'zsh-history-substring-search'
	'zsh')
source=("$pkgname.tar.gz::$url/archive/$_gitcommit.tar.gz")
md5sums=('SKIP')

package() {
	cd ${srcdir}
	install -D -m644 $srcdir/$pkgname-$_gitcommit/.zshrc ${pkgdir}/etc/skel/.zshrc
	mkdir -p $pkgdir/usr/share/zsh/scripts
	cp -r $srcdir/$pkgname-$_gitcommit/base16-shell $pkgdir/usr/share/zsh/scripts
	chmod a+x $pkgdir/usr/share/zsh/scripts/base16-shell/*
}
