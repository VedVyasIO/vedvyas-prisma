/*
  Warnings:

  - A unique constraint covering the columns `[userId]` on the table `UserVideoSuggestion` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `UserVideoSuggestion_userId_key` ON `UserVideoSuggestion`(`userId`);
