define KernelPackage/mediatek_hnat
  SUBMENU:=Network Devices
  TITLE:=Mediatek HNAT module
  DEPENDS:=@TARGET_mediatek +kmod-nf-conntrack
  AUTOLOAD:=$(call AutoLoad,20,mtkhnat)
  MODPARAMS.mtkhnat:=ppe_cnt=2
  KCONFIG:= \
	CONFIG_BRIDGE_NETFILTER=y \
	CONFIG_NETFILTER_FAMILY_BRIDGE=y \
	CONFIG_NET_MEDIATEK_HNAT
  FILES:= \
        $(LINUX_DIR)/drivers/net/ethernet/mediatek/mtk_hnat/mtkhnat.ko
endef

define KernelPackage/mediatek_hnat/description
  Kernel modules for MediaTek HW NAT offloading
endef

$(eval $(call KernelPackage,mediatek_hnat))

define KernelPackage/crypto-hw-mtk
  TITLE:= MediaTek's Crypto Engine module
  DEPENDS:=@TARGET_mediatek
  KCONFIG:= \
	CONFIG_CRYPTO_HW=y \
	CONFIG_CRYPTO_AES=y \
	CONFIG_CRYPTO_AEAD=y \
	CONFIG_CRYPTO_SHA1=y \
	CONFIG_CRYPTO_SHA256=y \
	CONFIG_CRYPTO_SHA512=y \
	CONFIG_CRYPTO_HMAC=y \
	CONFIG_CRYPTO_DEV_MEDIATEK
  FILES:=$(LINUX_DIR)/drivers/crypto/mediatek/mtk-crypto.ko
  AUTOLOAD:=$(call AutoLoad,90,mtk-crypto)
  $(call AddDepends/crypto)
endef

define KernelPackage/crypto-hw-mtk/description
  MediaTek's EIP97 Cryptographic Engine driver.
endef

$(eval $(call KernelPackage,crypto-hw-mtk))
