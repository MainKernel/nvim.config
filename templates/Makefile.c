# ==========================================
# 1. COMPILER & FLAGS SETUP
# ==========================================
CC = gcc

# Compiler flags:
# -Wall -Wextra : Enable all standard warnings
# -g            : Include debug information (essential for gdb/nvim-dap)
#
# -> EXAMPLES OF ADDING HEADER PATHS & CFLAGS:
# For GTK:   $(shell pkg-config --cflags gtk+-3.0)
# For MuPDF: $(shell pkg-config --cflags mupdf) OR -I/usr/include/mupdf
CFLAGS = -Wall -Wextra -g $(shell pkg-config --cflags gtk+-3.0)

# Linker flags (Libraries):
# -> EXAMPLES OF LINKING LIBRARIES:
# For Math:  -lm
# For GTK:   $(shell pkg-config --libs gtk+-3.0)
# For MuPDF: $(shell pkg-config --libs mupdf) OR -lmupdf -lmupdf-third -lfreetype -lz
LDLIBS = $(shell pkg-config --libs gtk+-3.0) -lmupdf -lm

# ==========================================
# 2. PROJECT FILES
# ==========================================
# Automatically find all .c files in the current directory
SRC = $(wildcard *.c)

# Generate a list of .o (object) files based on the SRC list
OBJ = $(SRC:.c=.o)

# The name of the final executable file
TARGET = app

# ==========================================
# 3. BUILD RULES
# ==========================================
# Default rule executed when running `make`
all: $(TARGET)

# How to build the final executable (linking all .o files together)
# IMPORTANT: $(LDLIBS) MUST be at the end of the command!
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^ $(LDLIBS)

# How to compile each individual .c file into an .o file
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# ==========================================
# 4. CLEANUP
# ==========================================
# Remove all compiled files (run `make clean`)
clean:
	rm -f $(OBJ) $(TARGET)
