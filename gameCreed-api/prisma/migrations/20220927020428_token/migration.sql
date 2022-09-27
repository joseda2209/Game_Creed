-- CreateTable
CREATE TABLE "AuthorizorToken" (
    "id" UUID NOT NULL,
    "token" VARCHAR(1000) NOT NULL,
    "userId" UUID NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuthorizorToken_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "AuthorizorToken" ADD CONSTRAINT "AuthorizorToken_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
