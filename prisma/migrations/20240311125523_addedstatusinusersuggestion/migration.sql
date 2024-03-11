/*
  Warnings:

  - You are about to drop the column `published` on the `UserVideoSuggestion` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `UserVideoSuggestion` DROP COLUMN `published`,
    ADD COLUMN `status` ENUM('APPROVED', 'REJECTED', 'PENDING') NOT NULL DEFAULT 'PENDING';
