import dotenv from 'dotenv';
import express, {Request, Response} from 'express'
import morgan from 'morgan';

dotenv.config();
const PORT : number = isNaN(parseInt('process.env.PORT')) ? 3001 : parseInt('process.env.PORT');

const app = express();

app.use(morgan('tiny'));

app.post("/mint/:wallet", async (req: Request, res: Response) => {
    const wallet : string = req.params.wallet;

    if(validateRequest(req, wallet)) {
        //connect to admin account
        //mint
        //listen to response status and return}
    }
    res.json(true);
});

app.listen(PORT, () => {
    console.log("Server listening at port "+PORT);
});

const validateRequest = (req: Request, wallet: string) : boolean => {
    //validate requester points
    return false;
};