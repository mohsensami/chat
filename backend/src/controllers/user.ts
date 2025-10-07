import { Router, Request, Response } from "express";

export const signIn = async (req: Request, res: Response) => {
  res.send("Sign in");
};

export const signUp = async (req: Request, res: Response) => {};

export const signOut = async (req: Request, res: Response) => {};

export const getUsers = async (req: any, res: Response) => {};
