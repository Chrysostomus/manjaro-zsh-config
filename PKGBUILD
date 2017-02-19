# Maintainer: Chrysostomus @forum.manjaro.org

pkgname=manjaro-zsh-config
pkgver=0.2
pkgrel=1
pkgdesc="Zsh configuration for manjaro"
arch=(any)
url="https://github.com/Chrysostomus/$pkgname"
_gitcommit=a3a084aff72cb72d275c08648f5be9a6a5e49e1a
license=('MIT')
conflicts=('grml-zsh-config')
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
	install -D -m644 $srcdir/$pkgname-$_gitcommit/rootzshrc ${pkgdir}/root/.zshrc
	mkdir -p $pkgdir/usr/share/zsh/scripts
	cp -r $srcdir/$pkgname-$_gitcommit/base16-shell $pkgdir/usr/share/zsh/scripts
	chmod a+x $pkgdir/usr/share/zsh/scripts/base16-shell/*
}
