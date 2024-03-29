pkg_name=less
pkg_origin=core
pkg_version=590
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_description="\
A terminal pager program used to view (but not change) the contents of a text \
file.\
"
pkg_upstream_url="http://www.greenwoodsoftware.com/less/index.html"
pkg_license=('gplv3+')
pkg_source="http://www.greenwoodsoftware.com/$pkg_name/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="6aadf54be8bf57d0e2999a3c5d67b1de63808bb90deb8f77b028eafae3a08e10"
pkg_deps=(
  core/glibc
  core/ncurses
  core/pcre
)
pkg_build_deps=(
  core/coreutils
  core/diffutils
  core/patch
  core/make
  core/gcc
)
pkg_bin_dirs=(bin)

do_build() {
  ./configure \
    --prefix="$pkg_prefix" \
    --sysconfdir=/etc \
    --with-regex=pcre
  make
}


# ----------------------------------------------------------------------------
# **NOTICE:** What follows are implementation details required for building a
# first-pass, "stage1" toolchain and environment. It is only used when running
# in a "stage1" Studio and can be safely ignored by almost everyone. Having
# said that, it performs a vital bootstrapping process and cannot be removed or
# significantly altered. Thank you!
# ----------------------------------------------------------------------------
if [[ "$STUDIO_TYPE" = "stage1" ]]; then
  pkg_build_deps=(
    core/gcc
    core/coreutils
  )
fi
