/*
  Warnings:

  - Added the required column `userId` to the `Challenge` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `ChallengeOption` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `ChallengeSet` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `Contest` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `TestCase` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Challenge` ADD COLUMN `userId` VARCHAR(255) NOT NULL;

-- AlterTable
ALTER TABLE `ChallengeOption` ADD COLUMN `userId` VARCHAR(255) NOT NULL;

-- AlterTable
ALTER TABLE `ChallengeSet` ADD COLUMN `userId` VARCHAR(255) NOT NULL;

-- AlterTable
ALTER TABLE `Contest` ADD COLUMN `userId` VARCHAR(255) NOT NULL;

-- AlterTable
ALTER TABLE `TestCase` ADD COLUMN `userId` VARCHAR(255) NOT NULL;

-- AddForeignKey
ALTER TABLE `Contest` ADD CONSTRAINT `Contest_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ChallengeSet` ADD CONSTRAINT `ChallengeSet_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Challenge` ADD CONSTRAINT `Challenge_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TestCase` ADD CONSTRAINT `TestCase_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ChallengeOption` ADD CONSTRAINT `ChallengeOption_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
