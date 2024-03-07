/*
  Warnings:

  - Added the required column `topicId` to the `UserVideoSuggestion` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `UserVideoSuggestion` ADD COLUMN `topicId` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `UserVideoSuggestion` ADD CONSTRAINT `UserVideoSuggestion_topicId_fkey` FOREIGN KEY (`topicId`) REFERENCES `Topic`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
