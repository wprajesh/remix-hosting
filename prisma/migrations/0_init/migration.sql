-- CreateTable
CREATE TABLE "IAgreeLegacyMerchant" (
    "id" TEXT NOT NULL,
    "shop" TEXT NOT NULL,
    "scriptTagId" TEXT NOT NULL,
    "migratedAt" TIMESTAMP(3),

    CONSTRAINT "IAgreeLegacyMerchant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "shop" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "isOnline" BOOLEAN NOT NULL DEFAULT false,
    "scope" TEXT,
    "expires" TIMESTAMP(3),
    "accessToken" TEXT NOT NULL,
    "userId" BIGINT,
    "firstName" TEXT,
    "lastName" TEXT,
    "email" TEXT,
    "accountOwner" BOOLEAN NOT NULL DEFAULT false,
    "locale" TEXT,
    "collaborator" BOOLEAN DEFAULT false,
    "emailVerified" BOOLEAN DEFAULT false,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stores" (
    "id" BIGSERIAL NOT NULL,
    "access_token" TEXT,
    "charge_id" BIGINT,
    "installation_nonce" VARCHAR(250),
    "is_charge_activated" BOOLEAN,
    "name" VARCHAR(250),
    "settings" TEXT
);

-- CreateIndex
CREATE UNIQUE INDEX "IAgreeLegacyMerchant_shop_key" ON "IAgreeLegacyMerchant"("shop");
