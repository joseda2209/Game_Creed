-- CreateTable
CREATE TABLE "Person" (
    "id" UUID NOT NULL,
    "names" VARCHAR(255) NOT NULL,
    "lastname" VARCHAR(255) NOT NULL,
    "document" VARCHAR(20) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "phoneNumber" BIGINT NOT NULL,
    "Address" VARCHAR(255) NOT NULL,
    "city" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "Person_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" UUID NOT NULL,
    "userName" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "lastAccess" TIMESTAMP NOT NULL,
    "rolId" UUID NOT NULL,
    "personId" UUID NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rol" (
    "id" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,

    CONSTRAINT "Rol_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Person_document_key" ON "Person"("document");

-- CreateIndex
CREATE UNIQUE INDEX "Person_email_key" ON "Person"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_personId_key" ON "User"("personId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_rolId_fkey" FOREIGN KEY ("rolId") REFERENCES "Rol"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_personId_fkey" FOREIGN KEY ("personId") REFERENCES "Person"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
