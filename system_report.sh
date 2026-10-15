#!/bin/bash

OUTPUT_FILE="system-report.txt"
> "$OUTPUT_FILE"

echo "==========================================" >> "$OUTPUT_FILE"
echo "           LINUX SYSTEM REPORT            " >> "$OUTPUT_FILE"
echo "   Generated on: $(date)                  " >> "$OUTPUT_FILE"
echo "==========================================" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "--- HOSTNAME ---" >> "$OUTPUT_FILE"
hostname >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "--- KERNEL VERSION ---" >> "$OUTPUT_FILE"
uname -r >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "--- DISK USAGE ---" >> "$OUTPUT_FILE"
df -h --total | grep -E 'Filesystem|total' >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "--- MEMORY USAGE ---" >> "$OUTPUT_FILE"
free -h >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "--- TOP 5 RUNNING PROCESSES (BY %CPU) ---" >> "$OUTPUT_FILE"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6 >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "Report successfully saved to $OUTPUT_FILE"